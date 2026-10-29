export default {
  extends: ['stylelint-config-standard'],
  rules: {
    'at-rule-no-unknown': [
      true,
      {
        ignoreAtRules: [
          'position-try',
          'starting-style',
          'layer',
          'tailwind',
          'apply',
          'config',
          'theme',
          'source',
        ],
      },
    ],
    'property-no-unknown': [
      true,
      {
        ignoreProperties: [
          'anchor-name',
          'position-anchor',
          'position-try-fallbacks',
          'position-try-order',
          'position-area',
        ],
      },
    ],
    'function-no-unknown': [
      true,
      {
        ignoreFunctions: ['anchor', 'anchor-size'],
      },
    ],
    // Tailwind v4 uses bare-string @import syntax, not url()
    'import-notation': 'string',
    // @position-try blocks accept regular CSS properties (e.g. translate),
    // not just official at-rule descriptors – disable the descriptor check
    'at-rule-descriptor-no-unknown': null,
  },
};
