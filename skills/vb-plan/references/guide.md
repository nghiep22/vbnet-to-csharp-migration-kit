# VB Migration Planning: hướng dẫn

## Task đủ nhỏ

Một task nên có ranh giới project, contract hoặc feature kiểm chứng được. Không chia một partial class/resource family thành các bước độc lập giả tạo khi compilation đòi ngữ cảnh đầy đủ. Không yêu cầu toàn solution xanh sau từng file.

## Công bố trạng thái

Pending, in-progress, blocked, completed là trạng thái công việc; pass/fail/not-run là kết quả kiểm chứng. Completed chỉ hợp lệ khi acceptance của task đã chạy đạt. Quyết định chưa chốt ghi rõ tác động và task bị ảnh hưởng.

## Hạn chế

Không sửa schema DB, đổi ORM, giao thức hoặc tái thiết kế UI chỉ để đơn giản hóa plan. Đề xuất lựa chọn nếu cần, và tiếp tục phần độc lập trong phạm vi được giao.

## Chọn chiến lược có bằng chứng

| Chiến lược | Khi phù hợp | Bằng chứng cần có trước khi chốt |
| --- | --- | --- |
| language-only | VB đã ở TFM đích, workload và package không cần port | Build VB, converter POC và baseline hành vi |
| language-first | C# trung gian vẫn build trên runtime nguồn | Converter load được project/reference và mốc build trung gian |
| runtime-first | Phụ thuộc/converter yêu cầu nâng runtime trước | POC port VB, package/API khả dụng và baseline hai mốc |
| assessment-only | Thiếu source, toolchain hoặc quyết định kiến trúc | Inventory và blocker có người/nguồn xử lý |

Chiến lược là lựa chọn của run, không là tuyên bố đã kiểm chứng. Nếu POC không chạy được, ghi lựa chọn là đề xuất và tạo task xác nhận trước task phụ thuộc. Target ứng dụng và runtime chạy converter là hai biến riêng.

## Dựng task graph

Tạo cạnh từ project reference thực tế, shared resource, generated code và public consumer. Tìm chu trình; nhóm phần phải build cùng thay vì tự đặt thứ tự giả. Với solution VB/C# hỗn hợp, kiểm tra từng consumer tham chiếu project mới theo TFM, assembly identity và API; không dùng tên file để suy tương thích.

Mỗi task có ranh giới file/project/capability, input snapshot, precondition, thay đổi dự kiến, output, dependency ID, acceptance quan sát được và evidence cần lưu. Ví dụ acceptance cho một library gồm build đúng config, API surface được so, các case semantic đã chọn có kết quả; chữ 'compile' đơn lẻ không đủ cho task parity.

## Quyết định trước task phụ thuộc

Đặt decision ID cho UI Web Forms, SOAP binding/security/consumer, package thương mại, COM bitness/license, ORM và thay schema. Mỗi decision ghi lựa chọn, lý do, phương án khác, tác động lên task và trạng thái proposed/confirmed/open. Task cần quyết định open giữ blocked hoặc phần acceptance chưa hoàn tất; task độc lập vẫn tiếp tục trong phạm vi cho phép.

## Mốc nghiệm thu và phục hồi

Định nghĩa mốc assessment coverage, baseline VB, conversion build, target build/publish và parity theo workload. Ghi task nào tạo evidence cho từng mốc. Rollback mô tả file/config/artifact do task đổi và cách phục hồi từ snapshot; không dùng reset toàn cây source khi có thay đổi của người dùng. Ước lượng theo số dependency/unknown và POC, ghi khoảng bất định thay vì tỉ lệ tự động hóa chưa đo.
