DATA_PATH = "./Data Files/"
filename = ""

LEN_QUESTIONS = 25
valid_lines_to_grade = []

answer_key = "B,A,D,D,C,B,D,A,C,C,D,B,A,B,A,C,B,D,A,C,A,A,B,D,D"
key_ans = answer_key.split(",")
student_number = []
class_grade = []
num_good_grade = 0

# Task 1
def openClass():
    global filename
    while True:
        filename = input("Enter a filename: ")
        # nếu input không có đuôi file thì ta thêm '.txt' vào
        if 'txt' not in filename:
            filename = filename + '.txt'
        path = DATA_PATH + filename
        try:
            f = open(path, "r+")
        except:
            print("File cannot be found.")
            continue
        else:
            print("Successfully opened", filename)
            break 
    return f



# Task 2
def analyzeClass():
    # mở file
    f = openClass()

    # tìm số dòng lỗi
    print("**** ANALYZING ****")

    global valid_lines_to_grade
    num_line = 0
    error = 0

    for line in f.readlines():
        num_line += 1
        ans_sheet = line.replace("\n","").split(",") # chuyển data thành mảng
        student_id = ans_sheet[0]

        if len(ans_sheet) != (LEN_QUESTIONS + 1): # kiểm tra lỗi thiếu đáp án
            print(f"Invalid line of data: does not contain exactly {LEN_QUESTIONS + 1} values.")
            print(line)
            error += 1

        elif not student_id[1:].isnumeric() or len(student_id) != 9: # Kiểm tra lỗi N#
            print("Invalid line of data: N# is invalid.")
            print(line)
            error += 1

        else:
            valid_lines_to_grade.append(ans_sheet)

    if error == 0:
        print("No errors found!")
    
    print("**** REPORT ****")
    print(f"Total valid lines of data: {num_line - error}")
    print(f"Total invalid lines of data: {error}")
    
    f.close()


# Task 3
def gradeClass():

    global valid_lines_to_grade, class_grade, num_good_grade, student_number
    analyzeClass()
    
    for ans_sheet in valid_lines_to_grade:
        student_number.append(ans_sheet[0]) # sử dụng cho task 4
        student_ans = ans_sheet[1:]

        score = 0
        for i in range(0, len(student_ans)):
            if student_ans[i] == '':
                continue
            elif student_ans[i] == key_ans[i]:
                score += 4
            else:
                score -= 1
        class_grade.append(score)

        if score > 80:
            num_good_grade += 1
    
def printFeatures():
    len_grade = len(class_grade)
    mean = round(sum(class_grade)/len_grade, 2)
    highest_score = max(class_grade)
    lowest_score = min(class_grade)
    range_score = highest_score - lowest_score
    sorted_class_grade = sorted(class_grade)

    if len_grade % 2 == 1:
        median_id = int((len_grade - 1) / 2)
        median = sorted_class_grade[median_id]
    else:
        median_id_1 = int(len_grade / 2)
        median_id_2 = median_id_1 - 1
        median = (sorted_class_grade[median_id_1] + sorted_class_grade[median_id_2])/2

    print("Total student of high scores:", num_good_grade)
    print("Mean (average) score:", mean)
    print("Highest score:", highest_score)
    print("Lowest score:", lowest_score)
    print("Range of scores: ", range_score)
    print(sorted_class_grade)
    print("Median score:", median)


# Task 4
def outputStudentGrade():
    gradeClass()
    global filename

    filename = filename.rstrip(".txt")
    filename = DATA_PATH + filename + "_grade.txt"
    with open(filename, "w") as fw:
        for i in range(len(class_grade)):
            fw.write(student_number[i] + "," + str(class_grade[i]) + "\n")
        print("Successfully write file " + filename)

outputStudentGrade()   