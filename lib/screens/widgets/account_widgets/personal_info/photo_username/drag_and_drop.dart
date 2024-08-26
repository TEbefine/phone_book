import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_book/cubit/update_%20profile_cubit/update_photo_cubit.dart';

class DragAndDrop extends StatefulWidget {
  const DragAndDrop({super.key});

  @override
  State<DragAndDrop> createState() => _DragAndDropState();
}

class _DragAndDropState extends State<DragAndDrop> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdatePhotoCubit, UpdatePhotoState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.blue,
              width: 1.2,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
          child: Column(
            children: [
              ElevatedButton(
                onPressed: state is UpdatePhotoLoading
                    ? null
                    : () => context
                        .read<UpdatePhotoCubit>()
                        .pickAndCropImage(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // Default background color
                  foregroundColor: Colors.black, // Text and icon color
                  elevation: 0, // Optional: removes shadow
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 20.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    side: BorderSide(color: Colors.grey.shade300),
                  ),
                ).copyWith(
                  // Apply styles based on button state
                  backgroundColor: WidgetStateProperty.resolveWith<Color>(
                    (Set<WidgetState> states) {
                      if (states.contains(WidgetState.disabled)) {
                        return Colors.white; // Background color when disabled
                      }
                      return Colors.white; // Background color when enabled
                    },
                  ),
                  foregroundColor: WidgetStateProperty.resolveWith<Color>(
                    (Set<WidgetState> states) {
                      if (states.contains(WidgetState.disabled)) {
                        return Colors.black.withOpacity(
                            0.5); // Text and icon color when disabled
                      }
                      return Colors.black; // Text and icon color when enabled
                    },
                  ),
                ),
                child: state is UpdatePhotoLoading
                    ? const CircularProgressIndicator(
                        strokeWidth: 8.0,
                        color: Colors.blue,
                      )
                    : const Icon(Icons.cloud_upload_outlined),
              ),
              const SizedBox(height: 7.0),
              Row(
                children: [
                  InkWell(
                    onTap: state is UpdatePhotoLoading
                        ? null
                        : () {
                            context
                                .read<UpdatePhotoCubit>()
                                .pickAndCropImage(context);
                          },
                    child: Text(
                      'Click to Upload',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: 12.0,
                            color: Colors.blue,
                          ),
                    ),
                  ),
                  Text(
                    ' or drag and drop',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 12.0,
                          color: Colors.grey[600],
                        ),
                  ),
                ],
              ),
              Text(
                'PNF, JPG or GIF [max.100x100px]',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: 12.0,
                      color: Colors.grey[600],
                    ),
              ),
            ],
          ),
        );
      },
    );
  }
}
