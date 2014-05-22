/** @jsx React.DOM */
'use strict';
define(['status'], function (Status) {
	return React.createClass({
        componentDidMount: function() {
            jQuery
                .ajax({ url: 'status' })
                .done(function(data) {
                    this.setState({
                        message: data.status
                    });
                }.bind(this));
        },
		getInitialState: function() {
			return {message: 'Loading!'};
		},
		goodbye: function(event) {
			this.setState({message: 'Goodbye.'});
		},
		render: function() {
			return (
                <Status message={this.state.message}  />
			);
		}
	});
});
