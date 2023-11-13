it('should return true if length less than 6', () => {
    expect(acceptablePasswordIiiTest("short")).toBe(false);
});
it('should have number in password', () => {
    expect(acceptablePasswordIiiTest("password")).toBe(false);
});

function acceptablePasswordIiiTest(password : string ){
    const number = ["1","2","3","4","5","6","7","8","9","0"]
    number.forEach(x=> {
        if (!isNaN(parseInt(password.split(""), 10))) {

        }

        return password.length > 6 && password.includes(x);
    });
}