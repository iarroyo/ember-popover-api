import Component from '@glimmer/component';
import { modifier } from 'ember-modifier';
import anchorName from 'ember-popover-api/modifiers/anchor-name';
import anchorPositioned from 'ember-popover-api/modifiers/anchor-positioned';
import type { Placement } from 'ember-popover-api/modifiers/anchor-positioned';

interface TooltipSignature {
  Args: {
    /** Text displayed inside the tooltip bubble. */
    content: string;
    /**
     * Preferred placement relative to the trigger.
     * The browser (or @oddbird polyfill) will automatically try the
     * remaining placements via `position-try-fallbacks` when there
     * is not enough space.
     * @default 'top'
     */
    placement?: Placement;
  };
  Blocks: {
    /** The element that acts as the anchor / hover target. */
    default: [];
  };
}

/** Monotonically incrementing counter – keeps anchor names unique per page. */
let tooltipCount = 0;

/**
 * Local modifier – shows/hides a `popover="manual"` element on
 * pointer hover and keyboard focus so the tooltip behaves like a
 * native tooltip without requiring a click.
 */
const hoverTrigger = modifier(function hoverTrigger(
  element: HTMLElement,
  [popoverId]: [string],
) {
  const getPopover = (): HTMLElement | null =>
    document.getElementById(popoverId);

  const show = () => getPopover()?.showPopover();
  const hide = () => getPopover()?.hidePopover();

  element.addEventListener('mouseenter', show);
  element.addEventListener('mouseleave', hide);
  // focusin/focusout bubble – works even when the trigger wraps a <button>
  element.addEventListener('focusin', show);
  element.addEventListener('focusout', hide);

  return () => {
    element.removeEventListener('mouseenter', show);
    element.removeEventListener('mouseleave', hide);
    element.removeEventListener('focusin', show);
    element.removeEventListener('focusout', hide);
  };
});

export default class Tooltip extends Component<TooltipSignature> {
  /** Stable per-instance ID used for anchor-name and aria linkage. */
  id = `tooltip-${++tooltipCount}`;

  get placement(): Placement {
    return this.args.placement ?? 'top';
  }

  <template>
    {{!
      Trigger wrapper
      – anchorName sets CSS `anchor-name` via JS (no style= in HTML)
      – hoverTrigger handles show/hide for mouse and keyboard
      – aria-describedby links the trigger to the tooltip for screen readers
    }}
    <span
      class="tooltip-trigger"
      aria-describedby={{this.id}}
      {{anchorName this.id}}
      {{hoverTrigger this.id}}
    >
      {{yield}}
    </span>

    {{!
      Tooltip popover
      – popover="manual" so only our JS (hoverTrigger) controls visibility
      – anchorPositioned sets `position-anchor` via JS and writes data-placement
        so app.css can apply anchor() insets + position-try-fallbacks
    }}
    <div
      id={{this.id}}
      role="tooltip"
      popover="manual"
      class="tooltip"
      {{anchorPositioned this.id placement=this.placement}}
    >
      {{@content}}
    </div>
  </template>
}
