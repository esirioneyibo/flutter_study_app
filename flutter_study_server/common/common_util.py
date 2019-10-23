def to_json_list(videos):
    result = []
    for item in videos:
        json = item.to_json()
        result.append(json)
    return result


def from_json_list(videos):
    result = []
    for item in videos:
        video = item.from_json()
        result.append(video)
    return result
