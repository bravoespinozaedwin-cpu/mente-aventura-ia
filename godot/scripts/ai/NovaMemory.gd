extends Resource

class_name NovaMemory

var friendship := 0

var trust := 0

var fear := 0

var happiness := 0

var sadness := 0

var crystals_found := 0

var player_name := ""

var last_topics := []

func remember(topic:String):

	last_topics.append(topic)

	if last_topics.size() > 20:

		last_topics.pop_front()
