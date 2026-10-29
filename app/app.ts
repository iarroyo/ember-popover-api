import '@warp-drive/ember/install';
// Tailwind CSS v4 — imported from JS so Vite transforms it through
// @tailwindcss/vite before serving (the virtual app.css link tag is
// served as a static file and bypasses Vite's transform pipeline).
import './styles/tailwind.css';
// @oddbird/css-anchor-positioning: auto-polyfills anchor positioning in
// browsers that don't yet support it natively.
import '@oddbird/css-anchor-positioning';
import Application from '@ember/application';
import compatModules from '@embroider/virtual/compat-modules';
import Resolver from 'ember-resolver';
import loadInitializers from 'ember-load-initializers';
import config from 'ember-popover-api/config/environment';
import { importSync, isDevelopingApp, macroCondition } from '@embroider/macros';
import setupInspector from '@embroider/legacy-inspector-support/ember-source-4.12';

if (macroCondition(isDevelopingApp())) {
  importSync('./deprecation-workflow');
}

export default class App extends Application {
  modulePrefix = config.modulePrefix;
  podModulePrefix = config.podModulePrefix;
  Resolver = Resolver.withModules(compatModules);
  inspector = setupInspector(this);
}

loadInitializers(App, config.modulePrefix, compatModules);
