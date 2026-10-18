#!/usr/bin/env sh
# Vérifie que les commits d'une MR respectent Conventional Commits.
#           Usage:
#            ./check-commit.sh <=> ./check-commit.sh HEAD origin/main
#            ./check-commit.sh <base> <head>
set -eu

base="${1:-${CI_MERGE_REQUEST_DIFF_BASE_SHA:-$(git merge-base origin/main HEAD)}}"
head="${2:-${CI_COMMIT_SHA:-HEAD}}"


commits="$(git rev-list --no-merges --reverse "$base..$head")"

if [ -z "$commits" ]; then
    echo "Aucun commit à vérifier entre $base et $head."
    exit 0
fi

message_file="$(mktemp)"
trap 'rm -f "$message_file"' EXIT

failed=""

for commit in $commits; do
    subject="$(git show --quiet --format=%s "$commit")"
    author="$(git show --quiet --format=%an "$commit")"

    echo "Checking $(git show --quiet --format='%h %s' "$commit")"

    # Ignore les commit autofix de precommit
    if [ "$subject" = "auto fixes from pre-commit CI job" ]; then
        case "$author" in
            "pre-commit fix "*)
                echo "[I] Accepted pre-commit autofix commit"
                continue
                ;;
        esac
    fi

    git show --quiet --format=%B "$commit" > "$message_file"

    if ! conventional-pre-commit --strict "$message_file"; then
        failed="$failed
  $(git show --quiet --format='%h %s' "$commit")"
    fi
done

if [ -n "$failed" ]; then
    cat <<EOF

Commits non conformes à Conventional Commits :$failed

Pour les corriger :
  git rebase -i $(git rev-parse --short "$base")   # remplacer « pick » par « reword » sur ces commits
  git push --force-with-lease
EOF
    exit 1
fi

echo "Tous les commits sont conformes."
