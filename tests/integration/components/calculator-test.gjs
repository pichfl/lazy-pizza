import { module, test } from 'qunit';
import { setupRenderingTest } from 'lazy-pizza/tests/helpers';
import { render } from '@ember/test-helpers';
import Calculator from 'lazy-pizza/components/calculator';

module('Integration | Component | calculator', function (hooks) {
  setupRenderingTest(hooks);

  test.skip('it renders', async function (assert) {
    // Updating values is achieved using autotracking, just like in app code. For example:
    // class State { @tracked myProperty = 0; }; const state = new State();
    // and update using state.myProperty = 1; await rerender();
    // Handle any actions with function myAction(val) { ... };

    await render(<template><Calculator /></template>);

    assert.dom().hasText('');

    // Template block usage:
    await render(
      <template>
        <Calculator>
          template block text
        </Calculator>
      </template>
    );

    assert.dom().hasText('template block text');
  });
});
