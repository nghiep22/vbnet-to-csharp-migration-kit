---
name: vb-convert
description: "Convert VB.NET project code to C# within an approved migration task, preserving VB semantics and tracking source-to-target mapping. Use after assessment and converter/toolchain selection; this skill does not itself supply a converter."
license: MIT
metadata:
  short-description: "Guide semantic-preserving VB conversion"
---

# VB to C# Conversion

Bản thiết kế chưa kiểm chứng trên ứng dụng thật. Thực hiện trong phạm vi người dùng giao và chỉ dùng công cụ thực sự có trong phiên.

## Đầu vào

Task/plan, source snapshot, converter đã kiểm tra và baseline cho phần cần đối chiếu.

## Đầu ra

C# changes, conversion map, diagnostics và kết quả ngữ nghĩa trong phạm vi task.

## Quy trình

1. Kiểm tra converter và phiên bản thực sự có, source TFM/runtime host, options và project references. Nếu không có converter phù hợp, ghi blocker; không giả lệnh/MCP.
2. Chạy preview hoặc output riêng với ngữ cảnh project/solution. Giữ source, encoding, file/resource provenance và configuration.
3. Kiểm tra conversion map cho mọi file trong scope; giữ nguyên public type names, RootNamespace semantics, reflection/resource lookup.
4. Rà các nhóm VB semantics trong guide, xử lý diagnostics theo cụm nguyên nhân. Sử dụng helper VB tương thích trong C# nếu cần bảo toàn hành vi.
5. Build trên target trung gian khi chiến lược chọn; chạy case so với VB và so side effect. Không chỉ sửa cho compile.
6. Ghi unsupported constructs và remaining work; không dùng throw NotImplementedException, return mặc định hoặc bỏ nhánh nghiệp vụ để coi xong.

## Kiểm tra kết quả

- C# mapping và compilation coverage có bằng chứng.
- Ngữ nghĩa nhạy cảm trong scope có baseline/đối chiếu hoặc not-run rõ.
- Không tự đổi runtime, ORM, UI hay contract trong task chuyển ngôn ngữ.

## Đọc khi cần

Khi thực hiện skill này, đọc [hướng dẫn chuyên biệt](references/guide.md) để chọn case, bằng chứng và tiêu chí hoàn tất phù hợp.
