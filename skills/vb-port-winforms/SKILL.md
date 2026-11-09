---
name: vb-port-winforms
description: "Migrate VB.NET WinForms application behavior to C# WinForms on .NET 8, focusing on application startup, Handles/WithEvents, designer/resources, data binding, settings and Windows-specific dependencies."
license: MIT
metadata:
  short-description: "Preserve WinForms behavior during port"
---

# VB WinForms Migration

Bản thiết kế chưa kiểm chứng trên ứng dụng thật. Thực hiện trong phạm vi người dùng giao và chỉ dùng công cụ thực sự có trong phiên.

## Đầu vào

Form/control/resource families, application framework settings, dependency inventory và UI baseline.

## Đầu ra

Form C# có mapping, startup/events/binding tương đương và designer/UI test evidence.

## Quy trình

1. Nhóm Form.vb, Designer.vb, resx, localized resources và custom controls; xác định generator và metadata DependentUpon/CustomTool.
2. Map startup object, MyApplication events, single-instance behavior, default form instance, settings/resources/user usage theo code thực tế.
3. Chuyển designer bằng converter hoặc tái sinh đúng công cụ; rà event Handles/WithEvents và constructor/init order. Không áp quy tắc cấm mọi thay đổi designer khi chính task là chuyển ngôn ngữ.
4. Đối chiếu binding/validation, DataSet/TableAdapter, thread affinity, async handler, disposal, modal ownership và close/shutdown.
5. Kiểm tra custom controls, COM/ActiveX, x86/x64, printing/reporting và API Windows; phần thiếu binary/licensing có trạng thái riêng.
6. Mở/lưu designer trong VS phù hợp, build và chạy luồng UI baseline; kiểm tra DPI/font/localization, event count và output/data effect.

## Kiểm tra kết quả

- Designer mở/lưu không làm mất layout hoặc event.
- Sự kiện không đăng ký hai lần và thay WithEvents giữ hành vi.
- Ảnh chụp chỉ là bằng chứng bổ sung cho workflow/data parity.

## Đọc khi cần

[Hướng dẫn chuyên biệt](references/guide.md) giải thích quyết định, ca biên và giới hạn của bước này. Đọc khi thực hiện phần tương ứng.
