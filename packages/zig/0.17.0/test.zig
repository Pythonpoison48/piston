const std = @import("std");

pub fn main() !void {
    const io = std.Io.Threaded.global_single_threaded.io();
    try std.Io.File.stdout().writeStreamingAll(io, "OK\n");
}
