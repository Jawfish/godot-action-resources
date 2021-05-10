extends Resource
class_name Action

signal action_signal(publisher)
signal action_signal_with_subject(publisher, subject)

func subscribe(subscriber, method: String) -> void:
	if _method_exists(subscriber, method):
		connect('action_signal', subscriber, method)

func subscribe_with_subject(subscriber, method: String) -> void:
	if _method_exists(subscriber, method):
		connect('action_signal_with_subject', subscriber, method)

func publish(publisher) -> void:
	emit_signal('action_signal', publisher)

func publish_with_subject(publisher, subject) -> void:
	emit_signal('action_signal_with_subject', publisher, subject)

func _method_exists(subscriber, method) -> bool:
	if !subscriber.has_method(method):
		push_error(str(subscriber) + ' doesn\'t have method ' + method)
		printerr(str(subscriber) + ' doesn\'t have method ' + method)
		return false
	return true
