# VB Behavioral Baseline: hướng dẫn

## Boundary phù hợp

Library: hàm/public API và serialized result. WinForms: event/UI workflow cùng dữ liệu đầu ra. Web: HTTP/auth/session/cookie và thao tác page. Service: operation/job result, retry và lifecycle. DB: dữ liệu trước/sau trong database test có thể reset an toàn.

## Nondeterminism

Clock, random ID và thứ tự record chỉ được normalize khi plan xác lập chúng không thuộc contract. Không bỏ qua sai khác tiền tệ, quyền dữ liệu, order quan trọng hoặc exception để làm test xanh.

## Baseline lỗi sẵn có

Ghi bug/diagnostic hiện tại; việc sửa bug là decision riêng. Source hash và config thuộc baseline. Tái ghi baseline sau thay đổi source cần phiên bản mới và giải thích.

## Chốt môi trường tham chiếu

Trước khi đổi source, lưu revision và trạng thái dirty, project/config/platform, SDK hoặc MSBuild/Visual Studio, targeting pack, kiến trúc CPU, culture/timezone, biến cấu hình không nhạy cảm và dependency ngoài. Lưu command nguyên văn, exit code và log cho restore, build, test và chạy app. Ghi tên secret/config source nhưng không lưu giá trị.

Nếu build gốc lỗi, phân biệt lỗi môi trường, dependency thiếu và lỗi đã có trong source. Một bản sửa để chạy được là nhánh baseline đã sửa; giữ snapshot gốc và diff, không gộp hai trạng thái.

## Chọn case có giá trị

| Nguồn rủi ro | Input nên khóa | Quan sát cần lưu |
| --- | --- | --- |
| Conversion/Compare | midpoint, overflow, culture, hoa thường, null | Giá trị, exception và so sánh |
| IIf/If, ByRef, On Error | nhánh có side effect hoặc lỗi, property/indexer | Thứ tự gọi, mutation và điểm tiếp tục |
| WinForms | mở/đóng, validation, thay object WithEvents | Thứ tự/số event và dữ liệu được ghi |
| Web/service | request hoặc job hợp lệ và lỗi | Status/fault, body, retry và side effect |
| Data | DBNull, transaction lỗi, concurrent update | Hàng trước/sau, rollback và quyền truy cập |

Ưu tiên luồng được người dùng xác nhận là quan trọng, tiếp theo là public contract và finding rủi ro cao. Mỗi case có ID, input và setup có thể tái tạo, kết quả VB quan sát được, nơi lưu log/trace và điều kiện dọn dữ liệu test. Tách expected theo contract đã duyệt khỏi expected được chạy từ VB; ghi rõ nguồn của từng cái.

## Chạy và lưu kết quả

Chạy trên dữ liệu cô lập theo phạm vi được giao. Với DB/file/network, ghi trạng thái trước/sau và giới hạn quyền. Chụp exception type/message hoặc phần message thuộc contract, không chỉ ghi pass/fail. Ghi các biến không ổn định như thời gian hoặc ID và quy tắc chuẩn hóa đã chốt; không chuẩn hóa tiền, thứ tự quan trọng hay quyền dữ liệu để che sai khác.

Một case không chạy được giữ not-run cùng nguyên nhân, command đã thử và prerequisite cụ thể. Baseline còn thiếu không chặn khảo sát và plan, nhưng những acceptance cần đối chiếu runtime phải giữ trạng thái chưa kiểm chứng.
