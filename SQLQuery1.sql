CREATE DATABASE QLcourse;
GO

USE QLcourse;

-- Creating the Product table
CREATE TABLE Product (
    Id INT PRIMARY KEY IDENTITY,
    Ten NVARCHAR(100) NOT NULL,        -- Course name
    Image NVARCHAR(200),               -- Image path
    Information NVARCHAR(MAX)          -- Course description
);

-- Inserting 20 products
INSERT INTO Product (Ten, Image, Information) VALUES 
(N'Introduction to Programming', 'Access/img/programming.png', N'Learn the basics of programming with hands-on examples and exercises.'),
(N'Data Structures and Algorithms', 'Access/img/data_structures.png', N'Understand core algorithms and data structures to improve programming efficiency.'),
(N'Web Development with HTML, CSS, and JavaScript', 'Access/img/web_dev.png', N'Build responsive websites with HTML, CSS, and JavaScript.'),
(N'Python for Data Science', 'Access/img/python_data_science.png', N'Master Python and its libraries for data analysis and visualization.'),
(N'Machine Learning Fundamentals', 'Access/img/machine_learning.png', N'Get introduced to the foundations of machine learning and AI.'),
(N'Database Management with SQL', 'Access/img/sql_database.png', N'Learn SQL for managing and querying databases effectively.'),
(N'Cloud Computing with AWS', 'Access/img/aws_cloud.png', N'Explore cloud computing principles and work with AWS services.'),
(N'Cybersecurity Basics', 'Access/img/cybersecurity.png', N'Understand essential cybersecurity concepts to protect systems and data.'),
(N'Mobile App Development with Flutter', 'Access/img/flutter_mobile.png', N'Develop cross-platform mobile apps using the Flutter framework.'),
(N'Advanced Java Programming', 'Access/img/advanced_java.png', N'Deep dive into advanced topics in Java programming.'),
(N'Introduction to Artificial Intelligence', 'Access/img/ai_intro.png', N'Learn about the basics and applications of artificial intelligence.'),
(N'Deep Learning with TensorFlow', 'Access/img/tensorflow.png', N'Master deep learning concepts and TensorFlow for building neural networks.'),
(N'Digital Marketing Fundamentals', 'Access/img/digital_marketing.png', N'Gain essential skills for online marketing and SEO.'),
(N'Project Management Essentials', 'Access/img/project_management.png', N'Learn key project management techniques and tools.'),
(N'Big Data with Hadoop', 'Access/img/big_data.png', N'Work with Hadoop to process and analyze large data sets.'),
(N'Blockchain Technology Overview', 'Access/img/blockchain.png', N'Get familiar with blockchain principles and applications.'),
(N'Design Thinking and Innovation', 'Access/img/design_thinking.png', N'Learn design thinking techniques to foster innovation.'),
(N'Game Development with Unity', 'Access/img/unity_game_dev.png', N'Create games using Unity, covering both 2D and 3D concepts.'),
(N'Business Analytics with Excel', 'Access/img/business_analytics_excel.png', N'Use Excel for business data analysis and decision-making.'),
(N'Photography and Photo Editing', 'Access/img/photography.png', N'Learn photography techniques and photo editing basics.');

-- Selecting data from Product table to verify insertion
SELECT * FROM Product;

-- Creating the Users table
CREATE TABLE Users (
    Id INT PRIMARY KEY IDENTITY(1,1),
    FullName NVARCHAR(100) NOT NULL,   -- User's full name
    Email NVARCHAR(255) UNIQUE NOT NULL, -- Email, ensuring uniqueness
    PasswordHash NVARCHAR(64) NOT NULL -- SHA-256 hashed password
);

-- Creating the Students table
CREATE TABLE Students (
    Id INT PRIMARY KEY IDENTITY(1,1),
    CourseId INT FOREIGN KEY REFERENCES Product(Id),
    FullName NVARCHAR(100),
    Email NVARCHAR(100)
);

-- Creating the Materials table
CREATE TABLE Materials (
    Id INT PRIMARY KEY IDENTITY(1,1),
    CourseId INT FOREIGN KEY REFERENCES Product(Id),
    MaterialName NVARCHAR(200),
    MaterialUrl NVARCHAR(500)
);

-- Creating the Assignments table
CREATE TABLE Assignments (
    Id INT PRIMARY KEY IDENTITY(1,1),
    CourseId INT FOREIGN KEY REFERENCES Product(Id),
    AssignmentName NVARCHAR(200),
    DueDate DATETIME,
    AssignmentUrl NVARCHAR(500)
);

-- Adding sample data (make sure CourseId exists in Product)
INSERT INTO Students (CourseId, FullName, Email) VALUES (61, N'Nguyen Van A', 'a@example.com');  -- Assuming CourseId 1 exists
INSERT INTO Materials (CourseId, MaterialName, MaterialUrl) VALUES (61, N'Tài liệu Python', '/uploads/python.pdf');  -- Assuming CourseId 1 exists
INSERT INTO Assignments (CourseId, AssignmentName, DueDate, AssignmentUrl) VALUES (61, N'Bài tập lập trình', '2023-11-01', '/uploads/assignment1.pdf');  -- Assuming CourseId 1 exists
  

  select * from Students

  DELETE FROM Students
WHERE Id = 3;


CREATE TABLE ForumComments (
    CommentId INT PRIMARY KEY IDENTITY,         -- ID của bình luận
    CourseId INT NOT NULL,                      -- ID của khóa học (kết nối với bảng Product)
    UserName NVARCHAR(100) NOT NULL,            -- Tên người dùng gửi bình luận
    CommentContent NVARCHAR(MAX) NOT NULL,      -- Nội dung bình luận
    CommentDate DATETIME DEFAULT GETDATE(),     -- Ngày giờ gửi bình luận
    FOREIGN KEY (CourseId) REFERENCES Product(Id) -- Khóa ngoại liên kết với bảng Product
);

-- Thêm các bình luận mẫu vào bảng ForumComments
INSERT INTO ForumComments (CourseId, UserName, CommentContent)
VALUES 
    (61, N'Nguyen Van A', N'Thầy giảng rất dễ hiểu, cảm ơn thầy!'),
    (61, N'Tran Thi B', N'Tài liệu rất đầy đủ và dễ hiểu.'),
    (61, N'Le Van C', N'Có thể cho thêm bài tập không?'),
    (61, N'Phan Thi D', N'Thắc mắc về phần cấu trúc dữ liệu mảng!'),
    (61, N'Do Van E', N'Bạn nào muốn lập nhóm học chung không?');

-- Xem dữ liệu đã chèn trong bảng ForumComments
SELECT * FROM ForumComments;
