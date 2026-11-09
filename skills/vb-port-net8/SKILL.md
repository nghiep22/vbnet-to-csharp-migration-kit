---
name: vb-port-net8
description: "Port projects in a VB.NET-to-C# migration to net8.0 or net8.0-windows, resolving SDK-style project, package, configuration and API compatibility issues after the sequencing strategy is established."
license: MIT
metadata:
  short-description: "Port converted projects to .NET 8"
---

# VB Migration Runtime Port

Bản thiết kế chưa kiểm chứng trên ứng dụng thật. Thực hiện trong phạm vi người dùng giao và chỉ dùng công cụ thực sự có trong phiên.

## Đầu vào

Source/target project, plan, package inventory và toolchain/môi trường đích.

## Đầu ra

Project C# .NET 8 build/publish, compatibility decisions và diagnostics còn lại.

## Quy trình

1. Kiểm tra target yêu cầu và SDK/targeting packs. Nếu cần Windows dùng net8.0-windows; không đổi sang .NET mới hơn vì tool host dùng SDK mới.
2. Chuyển project format theo source metadata thực tế; giữ assembly/root namespace, constants, resources, references, platform và build customization cần thiết.
3. Lập package compatibility matrix theo target, loại public/private và replacement. Chuyển packages.config khi phù hợp, không update mọi package lên latest vô điều kiện.
4. Phân loại API source/binary/behavioral và Windows-only. Đánh giá config, binding redirects, serialization, security, remoting/AppDomain/delegate invocation và hosting.
5. Restore/build/publish vào output thử; kiểm tra diagnostics và chạy parity theo plan. Chỉ bổ sung compatibility package khi API và platform thực tế cần.
6. Ghi vòng đời .NET 8 vào risk report và phần chưa xác nhận. Giữ nullable/async/style modernization thành task riêng.

## Kiểm tra kết quả

- Project thực sự target .NET 8 và publish chạy trong môi trường đích thử.
- Dependency không tương thích không bị xóa để che lỗi.
- Source, binary và behavioral changes đều có trạng thái.

## Đọc khi cần

[Hướng dẫn chuyên biệt](references/guide.md) giải thích quyết định, ca biên và giới hạn của bước này. Đọc khi thực hiện phần tương ứng.
