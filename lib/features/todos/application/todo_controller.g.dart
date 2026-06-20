// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TodoController)
final todoControllerProvider = TodoControllerProvider._();

final class TodoControllerProvider
    extends $NotifierProvider<TodoController, List<Todo>> {
  TodoControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'todoControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$todoControllerHash();

  @$internal
  @override
  TodoController create() => TodoController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Todo> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Todo>>(value),
    );
  }
}

String _$todoControllerHash() => r'0719ecd005863d15f80f41171ddc218dea4b23bb';

abstract class _$TodoController extends $Notifier<List<Todo>> {
  List<Todo> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<List<Todo>, List<Todo>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<Todo>, List<Todo>>,
              List<Todo>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
