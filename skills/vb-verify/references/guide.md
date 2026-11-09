# VB Migration Verification: hướng dẫn

## Test layers

Unit/semantic kiểm chứng rule VB. Integration đối chiếu DB, HTTP/SOAP, file và consumer. UI/lifecycle kiểm tra tương tác và state transitions. Publish smoke kiểm tra artifact trong môi trường target. Không một lớp đơn lẻ thay thế tất cả lớp khác.

## Điều kiện và output

Mỗi case có ID, category, status, baseline snapshot, source/target/config và evidence. Not-run có lý do. Fail có expected/actual/diff và task xử lý. Không gộp skip vào pass rate.

## Thiết kế fixture

Expected lấy từ VB tham chiếu. Nếu không chạy được nguồn, dùng approved contract như loại bằng chứng khác và giữ mức giới hạn rõ ràng; không tuyên bố đã đối chiếu hai runtime.
