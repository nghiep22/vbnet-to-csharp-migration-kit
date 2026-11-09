# VB semantic probe — chưa chạy

Project này là đầu vào POC dự kiến, không phải mẫu đã migrate. expected-design.json ghi output dự đoán từ tài liệu, chưa được phép coi là baseline đã thực thi.

Khi triển khai: build/chạy VB trên môi trường đúng → lưu actual stdout/toolchain/hash → chọn converter → build/chạy C# → so kết quả. Chỉ khi đó mới chuyển status của test. Không cần tải target pack hay chạy converter chỉ để kiểm tra cấu trúc repo.
