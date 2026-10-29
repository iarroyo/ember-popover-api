import { modifier } from 'ember-modifier';

/**
 * Shows and hides a `popover="manual"` element on pointer hover and keyboard
 * focus, giving any element tooltip-like behaviour without a wrapper component.
 *
 * Usage:
 *   <button {{hoverTrigger "my-tip"}}>…</button>
 *   <div id="my-tip" popover="manual" …>…</div>
 */
export default modifier(function hoverTrigger(
  element: HTMLElement,
  [popoverId]: [string],
) {
  const getPopover = (): HTMLElement | null =>
    document.getElementById(popoverId);

  const show = () => getPopover()?.showPopover();
  const hide = () => getPopover()?.hidePopover();

  element.addEventListener('mouseenter', show);
  element.addEventListener('mouseleave', hide);
  // focusin/focusout bubble — works when the element wraps a <button>
  element.addEventListener('focusin', show);
  element.addEventListener('focusout', hide);

  return () => {
    element.removeEventListener('mouseenter', show);
    element.removeEventListener('mouseleave', hide);
    element.removeEventListener('focusin', show);
    element.removeEventListener('focusout', hide);
  };
});
