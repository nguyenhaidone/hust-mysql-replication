# Hệ Phân Tán – Chương 5: Nhân bản và Nhất quán

## Bài thực hành: MySQL Master-Slave Replication
---
#### Câu 1:

**Trả lời:**  
Sau khi import dữ liệu từ file `pet.txt`, bảng `pet` trong cơ sở dữ liệu `petdatabase` có các bản ghi mẫu (các cột: name, owner, species, sex, birth, death).  
Khi chạy lệnh `SELECT * FROM pet;`, ta thấy toàn bộ dữ liệu được chèn vào.  
Khi dùng `INSERT` để thêm bản ghi mới, dữ liệu xuất hiện thành công trong bảng.  

---

#### Câu 2:

**Trả lời:**  
Lệnh `SHOW MASTER STATUS;` trên Master cung cấp tên file binlog và vị trí.  
Ví dụ:  
- File: `mysql-bin.000001`  
- Position: `107`  

Hai giá trị này được dùng cho lệnh `CHANGE MASTER TO` ở Slave.  

---

#### Câu 3:

**Trả lời:**  
File `petdatabase.sql` đã được gửi thành công sang máy Slave bằng `scp` hoặc `docker cp`.  
Vị trí lưu thường là thư mục mặc định (`/home/user/` hoặc `/tmp/petdatabase.sql`).  

---

#### Câu 4:

**Trả lời:**  
Khi chạy `SHOW SLAVE STATUS\G` trên Slave, ta thấy:  
- `Slave_IO_Running = Yes`  
- `Slave_SQL_Running = Yes`  

Điều này chứng tỏ replication đã hoạt động. Nếu `Seconds_Behind_Master = 0` thì Slave đã đồng bộ hoàn toàn với Master.  

---

#### Câu 5:

**Trả lời:**  
Sau khi thêm bản ghi mới vào Master bằng `INSERT`, chạy trên Slave:  

```sql
SELECT * FROM pet;
```
Nếu bản ghi xuất hiện, chứng tỏ dữ liệu đã được replicate thành công.

