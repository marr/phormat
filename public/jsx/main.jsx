/** @jsx React.DOM */
'use strict';

require.config({
	baseUrl: 'scripts',
	paths: {
		react: 'script/react.min',
	},
	shim: {
		react: {
			exports: 'React'
		}
	}
});

require(['app' ], function (App, Bootstrap) {
	// use app here
	React.renderComponent(
		<App schemaUrl="schema">
        </App>,
        
		document.getElementById('app')
	);
});
