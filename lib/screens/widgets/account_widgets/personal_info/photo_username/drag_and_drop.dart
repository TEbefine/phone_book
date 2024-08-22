import 'package:flutter/material.dart';

class DragAndDrop extends StatefulWidget {
  const DragAndDrop({super.key});

  @override
  State<DragAndDrop> createState() => _DragAndDropState();
}

class _DragAndDropState extends State<DragAndDrop> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.blue,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: BorderSide(color: Colors.grey.shade300),
              ),
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
            ),
            child: const Icon(Icons.cloud_upload_outlined),
          ),
          const SizedBox(height: 7.0),
          Row(
            children: [
              InkWell(
                onTap: () {
                  // ทำสิ่งที่คุณต้องการเมื่อคลิก เช่น เปิดหน้าต่างการอัปโหลด
                  print("Clicked to upload");
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
  }
}
