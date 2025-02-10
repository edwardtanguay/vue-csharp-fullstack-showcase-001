<script setup lang="ts">
import { ref, onMounted } from 'vue'

interface WeatherData {
  date: string
  temperatureC: number
  temperatureF: number
  summary: string
}

const weatherData = ref<WeatherData[]>([])

const fetchWeather = async () => {
  try {
    const response = await fetch('http://localhost:5200/weatherforecast')
    if (!response.ok) throw new Error('Failed to fetch weather data')

    weatherData.value = await response.json()
  } catch (error) {
    console.error('Error fetching weather data:', error)
  }
}

onMounted(fetchWeather)
</script>

<template>
  <div>
    <h2>Weather Forecast</h2>
    <ul v-if="weatherData.length">
      <li v-for="weather in weatherData" :key="weather.date">
        <strong>{{ weather.date }}</strong> - 
        {{ weather.temperatureC }}°C / {{ weather.temperatureF }}°F - 
        <em>{{ weather.summary }}</em>
      </li>
    </ul>
    <p v-else>Loading weather data...</p>
  </div>
</template>

<style scoped>
h2 {
  margin-bottom: 10px;
}
ul {
  list-style: none;
  padding: 0;
}
li {
  padding: 5px 0;
}
</style>

