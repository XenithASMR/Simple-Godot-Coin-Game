extends Label

var balance: int = 0

func _ready() -> void:
	update_display()

# Call this function whenever you want to increase the balance
func add_funds(amount: int) -> void:
	balance += amount
	update_display()

func reduce_funds(amount: int) -> void:
	balance -= amount
	update_display()

func update_display() -> void:
	text = "Balance: $" + str(balance)

func _on_coin_clicker_pressed() -> void:
	add_funds(10)

func _on_reduce_money_pressed() -> void:
	reduce_funds(10)
