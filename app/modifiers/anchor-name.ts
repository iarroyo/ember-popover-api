import { modifier } from 'ember-modifier';

/**
 * Sets the CSS `anchor-name` property on the element via JavaScript so
 * that the HTML template stays free of inline `style` attributes.
 *
 * Usage:
 *   <div {{anchorName "my-tooltip"}}>…</div>
 *   → sets style: anchor-name: --my-tooltip
 */
export default modifier(function anchorName(
  element: HTMLElement,
  [name]: [string],
) {
  element.style.setProperty('anchor-name', `--${name}`);

  return () => {
    element.style.removeProperty('anchor-name');
  };
});
