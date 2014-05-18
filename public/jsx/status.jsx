/** @jsx React.DOM */
'use strict';
define([], function() {
    var ReactTransitionGroup = React.addons.TransitionGroup;
    return React.createClass({
        render: function() {
            return (
                <ReactTransitionGroup transitionName="fade">
                    <img src='../../images/yeoman.png' />
                </ReactTransitionGroup>
            );
        }
    })
});
