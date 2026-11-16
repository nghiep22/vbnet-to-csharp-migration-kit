# VB Migration Verification: hướng dẫn

## Test layers

Unit/semantic kiểm chứng rule VB. Integration đối chiếu DB, HTTP/SOAP, file và consumer. UI/lifecycle kiểm tra tương tác và state transitions. Publish smoke kiểm tra artifact trong môi trường target. Không một lớp đơn lẻ thay thế tất cả lớp khác.

## Điều kiện và output

Mỗi case có ID, category, status, baseline snapshot, source/target/config và evidence. Not-run có lý do. Fail có expected/actual/diff và task xử lý. Không gộp skip vào pass rate.

## Thiết kế fixture

Expected lấy từ VB tham chiếu. Nếu không chạy được nguồn, dùng approved contract như loại bằng chứng khác và giữ mức giới hạn rõ ràng; không tuyên bố đã đối chiếu hai runtime.

## Lập ma trận từ acceptance

Mỗi acceptance của plan phải có ít nhất một case hoặc lý do chưa kiểm chứng. Nhóm case theo build, semantic, contract, data, UI, lifecycle và publish để tránh dùng kết quả build che khoảng trống workload. Lưu ID, source/target snapshot, config/platform, input, expected từ VB hoặc contract được duyệt, actual, command, exit code và đường dẫn evidence.

| Trạng thái | Điều kiện ghi |
| --- | --- |
| pass | Case đã chạy trên snapshot ghi nhận, so đúng tiêu chí và có evidence |
| fail | Case đã chạy và khác expected hoặc lỗi chạy; lưu diff/diagnostic |
| not-run | Chưa chạy hoặc không thể chạy; nêu prerequisite và tác động |

Case VB tham chiếu không chạy được có thể so với contract độc lập đã được chấp nhận, nhưng báo đó là contract verification; không gọi là runtime parity. Example synthetic không là baseline ứng dụng.

## So sánh có kiểm soát

Cho nguồn và đích cùng input, culture, timezone, quyền, kiến trúc CPU và dữ liệu khởi đầu. So giá trị, exception, thứ tự, side effect và contract wire theo loại case. Chỉ normalize field không ổn định đã có decision; giữ raw output để truy vết. Với DB, so trước/sau và transaction; với UI, so workflow/event/data; với service, so retry/lifecycle; với web, so status/header/body/auth/session.

Khi fail, tìm khác biệt nhỏ nhất và liên kết tới task/conversion finding. Sau sửa, chạy lại case fail và case liên quan; kết quả cũ phải gắn snapshot cũ. Khi thiếu runner/dependency, giữ not-run và không suy pass từ review source.

## Đối soát kết thúc

Đếm mọi file/resource trong scope qua conversion map, public API, resource lookup, tests bị bỏ qua và placeholder như NotImplementedException. Build/publish test cần đúng config/RID và môi trường đích thử. Ghi kết quả từng lớp cùng coverage và limitation; chỉ kết luận completed theo acceptance đã chạy và phạm vi đã được thống nhất.
