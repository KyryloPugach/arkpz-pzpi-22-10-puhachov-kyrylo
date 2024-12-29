local player = require("player")

print("=== Вітаємо у текстовій грі! ===")
player.init(100, 5)

while true do
    print("\nОберіть дію:")
    print("1. Додати бали")
    print("2. Зменшити здоров'я")
    print("3. Показати стан гравця")
    print("4. Зберегти стан")
    print("5. Завантажити стан")
    print("6. Вихід")

    local choice = tonumber(io.read())
    if choice == 1 then
        print("Введіть кількість балів:")
        local points = tonumber(io.read())
        player.updateScore(points)
    elseif choice == 2 then
        print("Введіть кількість шкоди:")
        local damage = tonumber(io.read())
        player.updateHealth(-damage)
    elseif choice == 3 then
        player.printStatus()
    elseif choice == 4 then
        player.saveState("player_state.json")
        print("Стан збережено.")
    elseif choice == 5 then
        player.loadState("player_state.json")
        print("Стан завантажено.")
    elseif choice == 6 then
        print("Вихід з гри.")
        break
    else
        print("Невірний вибір, спробуйте ще раз.")
    end
end
