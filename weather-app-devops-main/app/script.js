async function getWeather() {
    const city = document.getElementById("city").value.trim();
    const error = document.getElementById("error");
    const card = document.getElementById("weatherCard");

    error.textContent = "";
    card.style.display = "none";

    if (!city) {
        error.textContent = "Please enter a city name!";
        return;
    }

    const apiKey = "c0bebe0b43d4a52bf880e09fd78b9065";
    const url = `https://api.openweathermap.org/data/2.5/weather?q=${city}&units=metric&appid=${apiKey}`;

    try {
        const res = await fetch(url);
        const data = await res.json();

        if (data.cod !== 200) {
            error.textContent = "City not found!";
            return;
        }

        document.getElementById("location").textContent =
            `${data.name}, ${data.sys.country}`;

        document.getElementById("temp").textContent =
            `${Math.round(data.main.temp)}°C`;

        document.getElementById("desc").textContent =
            data.weather[0].description.toUpperCase();

        document.getElementById("extra").textContent =
            `Humidity: ${data.main.humidity}% | Wind: ${data.wind.speed} m/s`;

        document.getElementById("icon").src =
            `https://openweathermap.org/img/wn/${data.weather[0].icon}@2x.png`;

        document.getElementById("time").textContent =
            new Date().toLocaleString();

        card.style.display = "block";

    } catch (err) {
        error.textContent = "Error fetching weather data!";
    }
}
