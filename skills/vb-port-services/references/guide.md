# VB Service Migration: hướng dẫn

## SOAP

WSDL shape, operation/action, XML namespace, nullable/default/order, fault và authentication có thể là contract. Payload parity so với nguồn thực tế quan trọng hơn tên class tương tự. Giữ bản ghi request/response đã làm sạch dữ liệu nhạy cảm.

## Windows lifecycle

BackgroundService có hành vi lỗi/stop khác cách service cũ xử lý. Kiểm tra stop deadline, retry và Windows recovery trên môi trường phù hợp. Chuyển host không tự kéo theo serverless, Linux hoặc cloud deployment.

## Batch/job

Giữ thời điểm chạy theo timezone, overlap policy, checkpoint, transactional boundary và khả năng chạy lại. Test duplicate delivery/failure trước khi tuyên bố tương đương.
