import 'package:flutter/widgets.dart';

import 'render.dart';
import 'widget.dart';

class SliverPinnedPersistentHeaderElement extends RenderObjectElement {
  SliverPinnedPersistentHeaderElement(
      SliverPinnedPersistentHeaderRenderObjectWidget widget)
      : super(widget);

  @override
  SliverPinnedPersistentHeaderRenderObjectWidget get widget =>
      super.widget as SliverPinnedPersistentHeaderRenderObjectWidget;

  @override
  RenderSliverPinnedPersistentHeader get renderObject =>
      super.renderObject as RenderSliverPinnedPersistentHeader;

  Element _minExtentPrototype;
  static final Object _minExtentPrototypeSlot = Object();
  Element _maxExtentPrototype;
  static final Object _maxExtentPrototypeSlot = Object();

  @override
  void mount(Element parent, dynamic newSlot) {
    super.mount(parent, newSlot);
    renderObject.element = this;
    _minExtentPrototype = updateChild(_minExtentPrototype,
        widget.delegate.minExtentProtoType, _minExtentPrototypeSlot);
    _maxExtentPrototype = updateChild(_maxExtentPrototype,
        widget.delegate.maxExtentProtoType, _maxExtentPrototypeSlot);
  }

  @override
  void unmount() {
    super.unmount();
    renderObject.element = null;
  }

  @override
  void update(SliverPinnedPersistentHeaderRenderObjectWidget newWidget) {
    final SliverPinnedPersistentHeaderRenderObjectWidget oldWidget = widget;
    super.update(newWidget);
    final SliverPinnedPersistentHeaderDelegate newDelegate = newWidget.delegate;
    final SliverPinnedPersistentHeaderDelegate oldDelegate = oldWidget.delegate;
    if (newDelegate != oldDelegate &&
        (newDelegate.runtimeType != oldDelegate.runtimeType ||
            newDelegate.shouldRebuild(oldDelegate)))
      renderObject.triggerRebuild();
    _minExtentPrototype = updateChild(_minExtentPrototype,
        widget.delegate.minExtentProtoType, _minExtentPrototypeSlot);
    _maxExtentPrototype = updateChild(_maxExtentPrototype,
        widget.delegate.maxExtentProtoType, _maxExtentPrototypeSlot);
  }

  @override
  void performRebuild() {
    super.performRebuild();
    renderObject.triggerRebuild();
  }

  Element child;

  void build(double shrinkOffset, double minExtent, double maxExtent,
      bool overlapsContent) {
    owner.buildScope(this, () {
      child = updateChild(
        child,
        widget.delegate
            .build(this, shrinkOffset, minExtent, maxExtent, overlapsContent),
        null,
      );
    });
  }

  @override
  void forgetChild(Element child) {
    assert(child == this.child);
    this.child = null;
    // 1.20 @mustCallSuper.
    super.forgetChild(child);
  }

  @override
  void insertChildRenderObject(covariant RenderBox child, dynamic slot) {
    assert(renderObject.debugValidateChild(child));

    assert(child is RenderBox);
    if (slot == _minExtentPrototypeSlot) {
      renderObject.minProtoType = child;
    } else if (slot == _maxExtentPrototypeSlot) {
      renderObject.maxProtoType = child;
    } else {
      renderObject.child = child;
    }
  }

  @override
  void moveChildRenderObject(covariant RenderObject child, dynamic slot) {
    assert(false);
  }

  @override
  void removeChildRenderObject(covariant RenderObject child) {
    if (child == renderObject.minProtoType) {
      renderObject.minProtoType = null;
    } else if (child == renderObject.maxProtoType) {
      renderObject.maxProtoType = null;
    } else {
      renderObject.child = null;
    }
  }

  @override
  void visitChildren(ElementVisitor visitor) {
    if (child != null) {
      visitor(child);
    }
    if (_minExtentPrototype != null) {
      visitor(_minExtentPrototype);
    }
    if (_maxExtentPrototype != null) {
      visitor(_maxExtentPrototype);
    }
  }
}
