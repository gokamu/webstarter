import React from "react";
import ReactDOM from "react-dom";
import PropTypes from "prop-types";

const Portal = props => (
    <div>
        <h1>Hello {props.name}</h1>
    </div>
)

Portal.defaultProps = {
    name: "Marshall"
}

Portal.PropTypes = {
    name: PropTypes.string
}

document.addEventListener('DOMContentLoaded', () => {
    ReactDOM.render(
        <Portal name="React" />,
        document.body.appendChild(document.createElement('div'))
    )
})