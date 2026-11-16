# VB Source Assessment: hướng dẫn

## Bằng chứng và coverage

Một finding lưu rule ID, severity, claim type, file/line hoặc symbol, confidence, impact và proposed action. Đọc một query trong source chưa chứng minh toàn bộ nghiệp vụ của stored procedure. SQL động, plugin qua reflection và tích hợp private có thể cần runtime trace hoặc tài liệu bổ sung.

## Không bỏ qua generated code quan trọng

Designer, typed DataSet và service proxy có thể định nghĩa event/data/contract quan trọng. Đánh dấu generator và chọn cách tái sinh; không áp bộ lọc bỏ mọi generated file.

## Ranh giới helper

Nếu có Get-StaticInventory.ps1 từ kit, đó là helper đọc project/XML sơ bộ. Nó không resolve compilation, không phân tích call graph và không chứng minh package tương thích. Khi skill cài độc lập và helper không có, dùng công cụ đọc source sẵn có thay vì gọi đường dẫn giả.

## Phân loại

WinForms: Forms/designer và references; web: System.Web, markup, MVC/API signals; service: ServiceBase, svc/asmx/contracts; library: assembly/consumer. Một project có thể có nhiều dấu hiệu và cần review.

## Lập ranh giới khảo sát

Ghi solution/project root, commit hoặc hash của cây source, configuration, platform, target đang xem và các thư mục bị loại trừ. Với project nhiều target, xem từng tổ hợp có ảnh hưởng đến source có điều kiện hoặc reference. Ghi lý do cho file chưa đọc; không tính file bỏ qua vào độ phủ đã phân tích.

Quét ít nhất project/solution, Directory.Build.*, NuGet config, packages.config, app/web.config, resource và source được include theo điều kiện. Phân biệt file có trên đĩa với file thực sự được compile. Project dạng Web Site không có project file cần cách liệt kê riêng.

## Dựng bản đồ phụ thuộc và chức năng

Với mỗi project, ghi TFM, OutputType, startup, project/package/assembly/COM reference, nguồn package và trạng thái resolve. Đánh dấu cạnh phụ thuộc chỉ thấy qua reflection, config, DI hoặc native load là suy luận cho tới khi có bằng chứng chạy.

Chọn các entry point có tác động quan sát được: form event, page/controller/action, service operation, scheduled job hoặc public API. Lần theo entry point tới business rule, DB/file/network và output; ghi đường gọi có thể chứng minh và đoạn bị đứt. Không suy nghiệp vụ chỉ từ tên method hay bảng.

## Phân loại finding

| Loại | Bằng chứng đủ để ghi | Điều cần làm tiếp |
| --- | --- | --- |
| fact | Dòng source, project metadata, log hoặc contract cụ thể | Nêu điều thấy được, tránh suy ra hành vi runtime chưa chạy |
| inference | Nhiều dấu hiệu source nhưng thiếu trace/consumer | Ghi giả định và phép kiểm tra để xác nhận |
| unknown | Thiếu binary, config, SQL động, plugin hoặc môi trường | Ghi phần phụ thuộc và nguồn có thể cung cấp bằng chứng |

Ưu tiên finding có thể đổi chiến lược: late binding khi Option Strict Off, Option Compare, Handles/WithEvents, My.Forms, On Error/Resume, ByRef, resource name, binary/COM và contract bên ngoài. Mỗi finding cần ảnh hưởng cụ thể, vị trí source, mức tin cậy và hành động kiểm chứng; số lần xuất hiện không thay thế mức độ rủi ro.

## Bàn giao assessment

Tách inventory có thể đếm được khỏi architecture map và diễn giải. Nêu số file thấy/đã phân tích theo loại, project không load được, reference không resolve, luồng chưa lần được và câu hỏi cần trả lời trước khi lập plan. Nếu chỉ đọc XML/text, đặt mode là static và semanticResolved là false; chỉ nâng khi compilation thật sự resolve trong tổ hợp build đã ghi.
