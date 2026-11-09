# VB Migration Runtime Port: hướng dẫn

## Project metadata

Theo dõi embedded resource names, custom tools, linked files, code generation, application manifest, settings, publish/deployment scripts, x86/x64 và native dependency. Các resource designer/strongly typed phải có cách tái sinh và kiểm tra lookup.

## API không có tương đương trực tiếp

AppDomain isolation, Remoting, CAS, COM+ và một số công nghệ Framework cần giải pháp riêng. Một API có mặt có thể ném PlatformNotSupportedException lúc chạy. Compilation không đủ. Đừng coi Windows Compatibility Pack là giải pháp cho mọi công nghệ Framework.

## Lifecycle

Lịch Microsoft được đối chiếu 09/11/2026 ghi .NET 8 hết hỗ trợ 10/11/2026. Nếu .NET 8 vẫn là yêu cầu, giữ mục tiêu và ghi quyết định; không tự đổi target.
