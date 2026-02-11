var colors = ["Red", "Green", "Orange", "Blue", "Yellow"]
let numbers = [1, 2, 3, 4, 5]
let reading = [0.1, 0.2, 0.4, 0.8, 1.0]

print(colors[1])
print(reading[2])

colors.append("Purple")
colors.remove(at: 1)
print(colors.count)

print(colors.contains("Blue"))


