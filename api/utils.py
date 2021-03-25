def getAge(current_month, current_year, dob):
    
    calculated_year = calculated_month = None

    if dob is not None:
        birth_year, birth_month, birth_day = map(int, dob.split('-'))

        if birth_month > current_month:
            current_year = current_year - 1
            current_month = current_month + 12

        # calculate month, year
        calculated_month = current_month - birth_month
        calculated_year = current_year - birth_year

    return dict({"y": calculated_year, "m": calculated_month})