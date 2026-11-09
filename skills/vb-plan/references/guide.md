# VB Migration Planning: hướng dẫn

## Task đủ nhỏ

Một task nên có ranh giới project, contract hoặc feature kiểm chứng được. Không chia một partial class/resource family thành các bước độc lập giả tạo khi compilation đòi ngữ cảnh đầy đủ. Không yêu cầu toàn solution xanh sau từng file.

## Công bố trạng thái

Pending, in-progress, blocked, completed là trạng thái công việc; pass/fail/not-run là kết quả kiểm chứng. Completed chỉ hợp lệ khi acceptance của task đã chạy đạt. Quyết định chưa chốt ghi rõ tác động và task bị ảnh hưởng.

## Hạn chế

Không sửa schema DB, đổi ORM, giao thức hoặc tái thiết kế UI chỉ để đơn giản hóa plan. Đề xuất lựa chọn nếu cần, và tiếp tục phần độc lập trong phạm vi được giao.
