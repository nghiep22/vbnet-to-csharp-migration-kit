# Đánh giá hành vi skill — chưa chạy

scenarios.json là danh sách case dự kiến, không có result pass giả. Khi đánh giá, cung cấp yêu cầu và artifact tối thiểu cho agent; ghi hành vi, file tạo ra, tool calls và evidence. Có thể so cùng case có/không có skill.

Tiêu chí: đúng phạm vi; đúng bước; không gọi tool giả; evidence rõ; không nhầm static/semantic hoặc build/parity; không che phần not-run. Theo dõi lỗi có tác động thực tế hơn số token hoặc độ dài câu trả lời.
