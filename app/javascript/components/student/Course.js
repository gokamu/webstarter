import React from 'react';

import axios from 'axios';

export default class Course extends React.Component {
  state = {
    my_courses: []
  }

  componentDidMount() {
    axios.get(`/courses.json`)
      .then(res => {
        const my_courses = res.data;
        this.setState({ my_courses });
      })
  }

  render() {
    return (
      <ul>
        { this.state.my_courses.map(person => <li>{person.name}</li>)}
      </ul>
    )
  }
}