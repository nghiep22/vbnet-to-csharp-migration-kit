# VB Migration Runtime Port: hướng dẫn

## Project metadata

Theo dõi embedded resource names, custom tools, linked files, code generation, application manifest, settings, publish/deployment scripts, x86/x64 và native dependency. Các resource designer/strongly typed phải có cách tái sinh và kiểm tra lookup.

## API không có tương đương trực tiếp

AppDomain isolation, Remoting, CAS, COM+ và một số công nghệ Framework cần giải pháp riêng. Một API có mặt có thể ném PlatformNotSupportedException lúc chạy. Compilation không đủ. Đừng coi Windows Compatibility Pack là giải pháp cho mọi công nghệ Framework.

## Lifecycle

Lịch Microsoft được đối chiếu 09/11/2026 ghi .NET 8 hết hỗ trợ 10/11/2026. Nếu .NET 8 vẫn là yêu cầu, giữ mục tiêu và ghi quyết định; không tự đổi target.

## Đối chiếu project trước và sau

Lập bảng từ project nguồn tới project đích cho TargetFramework, OutputType, assembly name/version, RootNamespace, startup object, constants, configuration/platform, unsafe/signing, resource logical names, linked files, generator, manifest và publish settings. Kiểm tra property có điều kiện theo config/platform; project SDK-style mặc định include file có thể tạo compile/resource trùng nếu giữ Include cũ.

Chọn net8.0-windows khi workload hoặc API thật sự cần Windows, cùng UseWindowsForms/UseWPF nếu tương ứng. Ghi RuntimeIdentifier và bitness khi native/COM phụ thuộc. Không suy rằng SDK cài trên máy là target của ứng dụng.

## Ma trận package và API

Với từng package/assembly, ghi version hiện tại, consumer, target tương thích đã kiểm tra, feed/license, native asset và hướng giữ/thay/tách. packages.config và binding redirect không chuyển cơ học thành PackageReference; kiểm tra dependency transitive và config runtime. Không thay package private hoặc thương mại bằng package gần tên mà chưa có test contract.

Phân loại lỗi thành source break, binary load break, runtime/platform break và behavior break. Tìm API Framework thiếu như Remoting, CAS, AppDomain isolation, COM+ hoặc System.Web trong phần source thực sự dùng. Một API compile được vẫn cần test đường chạy có PlatformNotSupportedException hoặc hành vi đổi.

## Mốc chạy thử

Restore/build đúng config và target, rồi publish vào thư mục thử với RID/architecture cần thiết. Kiểm tra artifact có resource, config, native binary và dependency thực tế; chạy smoke trên môi trường target khi có. Lưu command, exit code, diagnostics, package decision và các case parity bị ảnh hưởng. Nếu package/API chưa giải quyết, giữ blocker và không xóa chức năng để báo port thành công.
