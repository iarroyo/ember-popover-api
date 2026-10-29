import { modifier } from 'ember-modifier';

export type Placement = 'top' | 'bottom' | 'left' | 'right';

/**
 * Wires a popover element to a CSS anchor by:
 *   1. Setting `position-anchor` via JavaScript (no inline style in HTML).
 *   2. Writing `data-placement` so app.css can apply the correct
 *      `anchor()` inset values and `position-try-fallbacks`.
 *
 * The `@position-try` fallback blocks and `position-try-fallbacks`
 * declarations live in app.css (not inline) so the @oddbird polyfill
 * can parse them from the stylesheet.
 *
 * Usage:
 *   <div popover {{anchorPositioned "my-tooltip" placement="top"}}>…</div>
 */
export default modifier(function anchorPositioned(
  element: HTMLElement,
  [anchorName]: [string],
  { placement = 'top' }: { placement?: Placement },
) {
  element.style.setProperty('position-anchor', `--${anchorName}`);
  element.dataset['placement'] = placement;

  return () => {
    element.style.removeProperty('position-anchor');
    delete element.dataset['placement'];
  };
});
