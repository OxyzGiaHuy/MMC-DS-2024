def write_file(data, name, mode):
    try:
        with open(name, mode) as file:
            for line in data:
                file.write(line)
    except Exception as e:
        print(f"Có lỗi xảy ra: {e}")


def read_file(path, mode):
    try:
        with open(path, mode) as file:
            data = []
            for line in file.readlines():
                data.append(line.strip().split(",")) 
            return data
    except Exception as e:
        print(f"Có lỗi xảy ra: {e}")
        return None