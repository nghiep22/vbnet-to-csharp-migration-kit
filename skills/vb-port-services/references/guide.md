# VB Service Migration: hướng dẫn

## SOAP

WSDL shape, operation/action, XML namespace, nullable/default/order, fault và authentication có thể là contract. Payload parity so với nguồn thực tế quan trọng hơn tên class tương tự. Giữ bản ghi request/response đã làm sạch dữ liệu nhạy cảm.

## Windows lifecycle

BackgroundService có hành vi lỗi/stop khác cách service cũ xử lý. Kiểm tra stop deadline, retry và Windows recovery trên môi trường phù hợp. Chuyển host không tự kéo theo serverless, Linux hoặc cloud deployment.

## Batch/job

Giữ thời điểm chạy theo timezone, overlap policy, checkpoint, transactional boundary và khả năng chạy lại. Test duplicate delivery/failure trước khi tuyên bố tương đương.

## Tách lifecycle khỏi hợp đồng dịch vụ

Với Windows Service/batch, ghi cách cài/chạy, service account, quyền file/DB/network, working directory, schedule/timezone, timer overlap, checkpoint và recovery. Với SOAP, ghi WSDL/XSD thực tế, binding, transport/security, operation/action, namespace, serializer, fault và consumer. Một project có thể cần cả hai bản đồ.

| Tình huống lifecycle | Quan sát cần so |
| --- | --- |
| Start/stop bình thường | Số job, thứ tự, thời gian dừng, trạng thái cuối |
| Stop giữa job | Cancellation, transaction, checkpoint, resume |
| Lỗi tạm thời | Retry count/backoff, duplicate effect, log/fault |
| Restart/recovery | Job bị lặp hoặc mất, state và quyền truy cập |
| Job chồng lấn | Lock/queue policy, dữ liệu cuối |

## Chọn host và contract

Worker/Generic Host là một lựa chọn cho service giữ Windows; ghi vì sao lifecycle hiện tại ánh xạ được. BackgroundService có xử lý exception/cancellation khác code ServiceBase; viết test cho đường lỗi thật trước khi nghiệm thu. Không suy việc port sang .NET 8 đồng nghĩa chuyển sang Linux/cloud hoặc thay scheduler.

WCF/ASMX cần quyết định theo feature và consumer. Nếu thử CoreWCF, ghi version, binding/security/serialization đã POC; nếu không phù hợp, nêu blocker và phương án có tác động contract. REST/gRPC là thay hợp đồng, cần decision và kế hoạch consumer. So payload XML, SOAP fault và auth của operation quan trọng, không chỉ so chữ ký method.

## Bàn giao

Lưu host config, command chạy test, log/trace, request/response đã làm sạch, job output và trạng thái pass/fail/not-run. Thiếu consumer, chứng thư, account hoặc endpoint thử thì phần integration tương ứng là not-run; không dùng mock logic làm bằng chứng tương thích wire contract.
