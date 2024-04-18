from .XuLyFile import *
from .MyPath import *

from IPython.display import clear_output # type: ignore


def tao_tai_khoan(name, password, sum_money):
    user_info = f"{name},{password},{sum_money}\n"
    write_file([user_info], PATH_DATA_TAI_KHOAN, "a")
    print(f"Đã tạo tài khoản {name} thành công!")


def lay_thong_tin_tai_khoan(username):
    try:
        list_account = read_file(PATH_DATA_TAI_KHOAN, "r")
        if list_account is None:
            return None
        for acc in list_account:
            if acc[0] == username:
                return acc
    except Exception as e:
        print(f"Có lỗi xảy ra: {e}")
        return None


def kiem_tra_admin(username):
    return username == "admin"


def kiem_tra_tai_khoan(username, password):
    global dang_nhap_status, user
    # Đọc dữ liệu từ file tài khoản
    lst_taikhoan = read_file(PATH_DATA_TAI_KHOAN, "r")
    if lst_taikhoan is None:
        return

    for tai_khoan in lst_taikhoan:
        if tai_khoan[0] == username and tai_khoan[1] == password:
            return kiem_tra_admin(username)


def check_dang_nhap(username, password):
    return kiem_tra_tai_khoan(username, password) in (0,1)             


def kiem_tra_ton_tai_tai_khoan(username):
    lst_acc = read_file(PATH_DATA_TAI_KHOAN, "r")
    if lst_acc is None:
        return False
    
    for acc in lst_acc:
        if acc[0] == username:
            return True
    return False


def xoa_tai_khoan(username):
    lst_acc = read_file(PATH_DATA_TAI_KHOAN, "r")
    if lst_acc is None:
        return

    for acc in lst_acc:
        if acc[0] == username:
            lst_acc.remove(acc)
            write_file([",".join(info) + '\n' for info in lst_acc], PATH_DATA_TAI_KHOAN, "w")   


def doi_mat_khau(username, password_cu, password_moi):
    lst_taikhoan = read_file(PATH_DATA_TAI_KHOAN, "r")

    for tai_khoan_info in lst_taikhoan:
        if tai_khoan_info[0] == username and tai_khoan_info[1] == password_cu:
            # Cập nhật mật khẩu mới
            tai_khoan_info[1] = password_moi
            # Ghi lại dữ liệu mới vào file
            write_file([','.join(tai_khoan) + '\n' for tai_khoan in lst_taikhoan], PATH_DATA_TAI_KHOAN, "w")
            print("Đổi mật khẩu thành công.")
            return

    print("Không tìm thấy tài khoản hoặc mật khẩu cũ không đúng.")
    return


def nap_tien(username, so_tien_nap):
    lst_acc = read_file(PATH_DATA_TAI_KHOAN, "r")

    for acc in lst_acc:
        if acc[0] == username:
            acc[2] = str(int(acc[2])+so_tien_nap)

            write_file([",".join(info)+'\n' for info in lst_acc], PATH_DATA_TAI_KHOAN, "w")
            print(f"Đã nạp {so_tien_nap} vào tài khoản {username}.")
            return
        
    print("Không tìm thấy tài khoản.")
    return