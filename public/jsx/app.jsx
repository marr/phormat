/** @jsx React.DOM */
'use strict';
define(['status'], function (Status) {
	return React.createClass({
		getInitialState: function() {
			return {message: 'Loading!'};
		},
		goodbye: function(event) {
			this.setState({message: 'Goodbye.'});
		},
		render: function() {
			return (
                <Status message={this.state.message}/>
			);
		}
	});
});
