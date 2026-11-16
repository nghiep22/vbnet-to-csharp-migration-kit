# VB WinForms Migration: hướng dẫn

## Designer và resource

Chuyển cả family partial class và resx. Kiểm tra namespace/type trong serialized resource, icon/image, neutral/satellite culture, logical name, manifest, application icon và Settings.Designer. Nếu cần regenerate thì lưu lệnh/công cụ và so sự thay đổi.

## Test UI

Ưu tiên UI Automation/FlaUI khi có môi trường Windows desktop. Thiếu runner hoặc thư viện UI được báo not-run. Đối chiếu thao tác, kết quả binding, validation, thứ tự event, đóng form và ghi dữ liệu. Screenshot không chứng minh các side effect đó.

## Phạm vi

Đích là WinForms net8.0-windows khi giữ workload. Đổi WinForms thành web/WPF là quyết định kiến trúc khác, không suy từ yêu cầu đổi VB sang C#.

## Chuyển theo family của form/control

Liệt kê Form.vb, Form.Designer.vb, resx trung tính và từng culture, custom control, Settings, application manifest cùng generator. Đối chiếu tên partial class, namespace, resource base name và thuộc tính project sau chuyển. Nếu regenerate designer, lưu tool/version và diff; nếu chỉnh tay, mở và lưu trong designer thật để phát hiện serialization bị mất.

Lập bảng startup cho Sub Main hoặc VB Application Framework: main form, splash, single-instance, startup/shutdown events, exception handling, user settings và My.Forms default instance. Kiểm tra có bao nhiêu instance được tạo và thời điểm tạo; chuyển sang new Form ở mọi call site có thể đổi state.

## Event và binding

Với từng WithEvents/Handles quan trọng, ghi object phát event, nơi gán/thay object, handler, thời điểm đăng ký/hủy và thứ tự so với InitializeComponent. Chạy case gán lại object, mở/đóng form nhiều lần và dispose. Đếm event để bắt đăng ký kép hoặc handler bị mất; không dựa vào build để xác nhận.

Đối chiếu BindingSource, DataSet/TableAdapter, validation, ErrorProvider, format/parse, selected item, modal owner và cancellation. UI thread affinity và async handler phải được kiểm tra ở luồng thao tác thật. Với custom control/ActiveX, ghi bitness, runtime/license và trạng thái chạy thử riêng.

## Nghiệm thu UI

Case nên lưu chuỗi thao tác, dữ liệu ban đầu, control state, validation message, dữ liệu cuối và event trace. So DPI/font/culture và ảnh chụp khi layout là một phần contract; ảnh không thay thế dữ liệu hay event evidence. Nếu thiếu máy Windows/designer/UI runner, giữ phần tương ứng not-run và bàn giao prerequisite cụ thể.
