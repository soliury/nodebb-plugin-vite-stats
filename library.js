"use strict";

var nconf = require.main.require('nconf');
var async = require.main.require('async');
var cache = require('memory-cache');
var request = require('request');
var validator = require.main.require('validator');
var topics = require.main.require('./src/topics');
var settings = require.main.require('./src/settings');
var groups = require.main.require('./src/groups');
var socketAdmin = require.main.require('./src/socket.io/admin');
var defaultSettings = { title: 'Recent Topics', opacity: '1.0', textShadow: 'none', enableCarousel: 0, enableCarouselPagination: 0 };

var plugin = module.exports;
var app;

var FULL_NODE_KEY = 'vite-full-node-stats';
var STATS_HEADER_KEY = 'vite-stats-header'
var DATA_CACHE_TIME = 1000 * 60;
var TIMEOUT = 1000;

plugin.init = function(params, callback) {
	app = params.router;
	var middleware = params.middleware;

	plugin.settings = new settings('recentcards', '1.0.0', defaultSettings);

	socketAdmin.settings.syncRecentCards = function () {
		plugin.settings.sync();
	};

	callback();
};

plugin.addAdminNavigation = function(header, callback) {
	header.plugins.push({
		route: '/plugins/recentcards',
		icon: 'fa-tint',
		name: 'Recent Cards'
	});

	callback(null, header);
};

plugin.defineWidgets = function(widgets, callback) {
    callback(null, widgets.concat([
        {
            widget: "viteHeader",
            name: "Vite Stats Header",
            description: "Show the Vite Stats in header",
        },
        {
            widget: "viteNodes",
            name: "Vite Full Nodes",
            description: "Show the Vite Full Nodes List in custom page",
        }
	]));
};

plugin.renderHeaderWidget = function(widget, callback) {
	var templateData = {
        config: {
            relative_path: nconf.get('relative_path'),
        },
		size: 0,
        totalReward: null
    };

	var viteStats = cache.get(STATS_HEADER_KEY)

	if (!viteStats) {
        request('https://stats.vite.net/api/forbbs', {timeout: TIMEOUT}, function (err, response, body) {
            if (err) {
                renderWidget('partials/nodebb-plugin-vite-stats/header', widget, templateData, callback)
                return;
            }

        	try {
                if (!body) {
                    body = {data: {}}
                } else {
                    body = JSON.parse(body)
                }
			}
			catch (e) {
        		body = {data: {}}
            }
            templateData = Object.assign({}, templateData, body.data);
            if (templateData.totalReward) {
            	templateData.totalReward = parseInt(templateData.totalReward)
			}
			if (templateData.userTotalReward) {
            	templateData.userTotalReward = parseInt(templateData.userTotalReward)
			}
            cache.put(STATS_HEADER_KEY, templateData, DATA_CACHE_TIME);
            renderWidget('partials/nodebb-plugin-vite-stats/header', widget, templateData, callback)
        })
	} else {
        renderWidget('partials/nodebb-plugin-vite-stats/header', widget, viteStats, callback)
	}
}

plugin.renderNodesWidget = function (widget, callback) {
    var templateData = {
        config: {
            relative_path: nconf.get('relative_path'),
        },
        size: 0,
        list: []
    };

    var viteStats = cache.get(FULL_NODE_KEY)

    if (!viteStats) {
        request('https://stats.vite.net/api/getPeers', {timeout: TIMEOUT}, function (err, response, body) {
            try {
                if (!body) {
                    body = {list:[]}
                } else {
                    body = JSON.parse(body)
                }
            }
            catch (e) {
                body = {list:[]}
            }
            templateData.list = body.list.map((item, index) => {
            	var nodeDetail = item.nodeDetail || {}
            	var osInfo = nodeDetail.osInfo || {}
            	var ipInfo = nodeDetail.ipInfo || {}
            	return Object.assign({}, item, item.nodeDetail || {}, {
            		number: index + 1,
					status: nodeDetail.isok ? 'Active': 'Not Active',
					os: osInfo.os + '-' + osInfo.platform + ' ' + osInfo.platformVersion,
					location: ipInfo.country_name + ' ' + ipInfo.region_name
				})
			});
            cache.put(FULL_NODE_KEY, templateData, DATA_CACHE_TIME);

            renderWidget('partials/nodebb-plugin-vite-stats/node', widget, templateData, callback)
        })
    } else {
        renderWidget('partials/nodebb-plugin-vite-stats/node', widget, viteStats, callback)
    }
}


function renderWidget(template, widget, data, callback) {
    app.render(template, data, function (err, html) {
        if (err) {
            return callback(err);
        }
        widget.html = html;
        callback(null, widget);
    });
}
