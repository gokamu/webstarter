import React from 'react'
import ReactDOM from 'react-dom'
import App from './App'
import '../components/student/assets/css/bootstrap.min.css'
import '../components/student/assets/css/light-bootstrap-dashboard.css'
import '../components/student/assets/css/dashboard.css'

document.addEventListener('DOMContentLoaded', () => {
    ReactDOM.render(
      <App />,
      document.body.appendChild(document.createElement('div')),
    )
  })