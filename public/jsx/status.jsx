/** @jsx React.DOM */
'use strict';
define([], function() {
    var ReactTransitionGroup = React.addons.TransitionGroup;
    return React.createClass({
        handleClick: function(e) {
            console.log(this);
        },
        render: function() {
            return (
                <ReactTransitionGroup transitionName="fade">
                    <img src='../../images/yeoman.png' alt="Phormat Status"
                        title={this.props.message}
                        onClick={this.handleClick}
                    />
                </ReactTransitionGroup>
            );
        }
    })
});
