# VB WinForms Migration: hướng dẫn

## Designer và resource

Chuyển cả family partial class và resx. Kiểm tra namespace/type trong serialized resource, icon/image, neutral/satellite culture, logical name, manifest, application icon và Settings.Designer. Nếu cần regenerate thì lưu lệnh/công cụ và so sự thay đổi.

## Test UI

Ưu tiên UI Automation/FlaUI khi có môi trường Windows desktop. Thiếu runner hoặc thư viện UI được báo not-run. Đối chiếu thao tác, kết quả binding, validation, thứ tự event, đóng form và ghi dữ liệu. Screenshot không chứng minh các side effect đó.

## Phạm vi

Đích là WinForms net8.0-windows khi giữ workload. Đổi WinForms thành web/WPF là quyết định kiến trúc khác, không suy từ yêu cầu đổi VB sang C#.
