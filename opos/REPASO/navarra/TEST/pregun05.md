# Pregunta sobre PHP dictonaries

A una API que facilita información sobre la situación meteorológica y el clima, se le solicita información de la siguiente forma:

    $url = "http://api.openweather.org/data";
    $json_file = file_get_content($url);
    $vars = json_decode($json_file )

y se obtiene la respuesta, con el siguiente formato:

{
    "cod": "200",
    "message": 0.0173, "cnt": 40,
    "list": [{
        "dt": 1526504400, 
        "main": {
            "temp": 283.29,
            "temp_min": 283.29,
            "temp_max": 285.987,
            "pressure": 969.15, "sea_level": 1031.96, "grnd_level": 969.15, "humidity": 68,
            "temp_kf": -2.7
        },
        "weather": [{
            "id": 800,
            "main": "Clear",
            "description": "clear sky",
            "icon": "01n"
        }],
        "clouds": {
            "all": 0
        },
        "wind": {
            "speed": 3.71,
            "deg": 0.500977
        },
        "rain": {},
        "sys": {
            "pod": "n"
        },
        "dt_txt": "2018-05-16 21:00:00"
    }, {
    "dt": 1526515200,
    "main": {……………………………………………..(Se repite la estructura)
