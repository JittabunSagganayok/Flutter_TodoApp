# TodoApp (Skooldio 2version with Bloc and without) เช็คดูชื่อ commit


1. สร้าง class ข้อมูล item ประกาศตัวแปรว่าจะเก็บอะไรบ้าง ทำ frommap และ tomap
2. bloc ต้องการ state และ event
   สร้าง class สำหรับ state 1.initstate 2.liststate
3. สร้าง class event = Add update delete delete fetch (คล้ายๆCRUD)
4. Provider คือ สร้างความสามารถในการกระทำกับ database Opendb,fetch,insert,update,delete (CRUD) db ใช้ package sqflite
5. bloc ต้องการ state และ event โดยหน้านี้ bloc จะทำการผูกคำสั่งของ event กับ คำสั่งของ provider
